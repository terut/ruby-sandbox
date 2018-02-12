conn = Userdata.new("conn")
v = Nginx::Var.new
host = conn.redis.get(v.host)

if host
  Nginx.rputs "##### #{v.host}"
  Nginx.return Nginx::HTTP_OK
else
  Nginx.return Nginx::HTTP_NOT_FOUND
end
