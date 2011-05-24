def join_path(*args)
  File.join(args)
end

def mv_if_exists(src, dest)
  if File.exists?(src)
    mv(src, dest, :force => true)
  end
end
