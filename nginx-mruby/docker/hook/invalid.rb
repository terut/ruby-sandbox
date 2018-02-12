conn = Userdata.new("conn")
v = Nginx::Var.new
host = conn.redis.get(v.host)

if host
  0 
else
  1
end
