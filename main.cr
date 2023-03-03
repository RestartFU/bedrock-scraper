require "./query"

r = Query.query "nitrofaction.fr", 19132

if r != nil
    puts r
end