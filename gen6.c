#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <unistd.h>
#include <dirent.h>

static void remoove (const char *path) {
  char fpath[255];
  DIR *dir =  opendir(path);
  if (!dir) {
    perror("opendir");
    return;
  }
  struct dirent *d;
  while ((d = readdir(dir)) != NULL) {
    if (strcmp(d->d_name, ".") == 0) continue;
    if (strcmp(d->d_name, "..") == 0) continue;
    snprintf(fpath, sizeof(fpath), "%s/%s", path,d->d_name);
    struct stat st;
    if (lstat(fpath, &st) == 0 &&  S_ISDIR(st.st_mode)) {
      remoove(fpath);
    }
    else {
      unlink(fpath);
    }
  }
  closedir(dir);
  rmdir(path);
}

int clean (const char *name) {
 char path[255];
 snprintf(path, sizeof(path), "/etc/s6/sv/%s" ,name);
 char link[255];
 snprintf(link, sizeof(link), "/run/service/%s", name);

 unlink(link);
 remoove(path);
 return 0;
 }

int createservice (const char *name, const char *command, const char *user, int down, int oneshot, const char *add) {
  char path[255];
  char run[255];
  char down_p[255];
  char type[255];
  FILE *pFile;
  FILE *pdFile;
  FILE *ptFile;
  snprintf(path, sizeof(path), "/etc/s6/sv/%s" ,name);
  snprintf(run, sizeof(run), "%s/run", path);
  snprintf(down_p, sizeof(down_p), "%s/down", path);
  snprintf(type, sizeof(type), "%s/type", path);

    if (mkdir(path, 0755) == -1 && errno != EEXIST) {
      perror("mkdir");
      return 1;
    }
  
    pFile = fopen(run, "w");
      if (pFile == NULL) {
        perror("fopen");
        return 1;
      }
    fprintf(pFile, "#!/bin/sh\n");
    //fprintf(pFile, "exec %s\n", command);
    //fclose(pFile);

    if (chmod(run, 0755) == -1) {
      perror("chmod");
      return 1;
    }

    if (down) {
      pdFile = fopen(down_p, "w");
      if (pdFile == NULL) {
        perror("fopen");
        return 1;
      }
      fclose(pdFile);
    }

    if (oneshot) {
      ptFile = fopen(type, "w");
      if (ptFile == NULL) {
        perror("fopen");
        return 1;
        }
      fprintf(ptFile, "oneshot\n");
      fclose(ptFile);
      
    }

    if (add != NULL) {
      fprintf(pFile, "%s\n", add);
    }

    if (user) {
      fprintf(pFile, "exec s6-setuidgid %s %s\n", user, command);
    }
    else {
    fprintf(pFile, "exec %s\n", command);
    }
    fclose(pFile);
    
  return EXIT_SUCCESS;
}

static int l_createservice (lua_State *L) {
  const char *name = luaL_checkstring(L, 1);
  const char *command = luaL_checkstring(L, 2);
  const char *user = luaL_optstring(L, 3, NULL);
  int down = lua_toboolean(L, 4);
  int oneshot = lua_toboolean(L, 5);
  const char *add = luaL_optstring(L, 6, NULL);
  int result = createservice(name, command, user, down, oneshot, add);
  lua_pushinteger(L, result);
  return 1;
}

int main (int argc, char **argv) {
  if (argc >= 2 && strcmp(argv[1], "-c") == 0) {
    int failed = 0;
    for (int i = 2; i < argc; i++) {
      failed |= clean(argv[i]);
    }
    return failed;
  }
  
  const char *cfg = (argc > 1) ? argv[1] : "/etc/s6/gen6.lua";
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  lua_pushcfunction(L, l_createservice);
  lua_setglobal(L, "createservice");


  //prototype 
  /*if (argc != 3) {
  fprintf (stderr, "Usage is %s <name> <command>\n", argv[0]);
    return 1;
    }*/
  
  //return createservice(argv[1], argv[2]);

  if (luaL_dofile(L, cfg) != 0) {
    fprintf(stderr, "%s\n", lua_tostring(L, -1));
    return 1;
  }
  lua_close(L);
  
  return EXIT_SUCCESS;
}

