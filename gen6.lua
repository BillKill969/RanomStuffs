local services = {
  {name = "cronie", command = "/usr/bin/crond -f"},
  {name = "kmscon-tty1", command = "kmscon \
  --vt=2 \
  --seat=seat0 \
  --login-propogate-env \
  --login-no-reset \
  -- /bin/login", add = [[ export TERM=xterm-256color ]]}
}


 for _, sv in ipairs(services) do
 local check = createservice(sv.name, sv.command, sv.user, sv.down, sv.oneshot, sv.add)
 if check == 0 then
 print ('Service created ' ..sv.name)
 else
 print ('Failed to create service ' ..sv.name)
 end
 end
