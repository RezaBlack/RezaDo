local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'" Messages Was Removed',
ok_cb, false)
  else
    send_msg(extra.chatid, 'Messages Was Removed', ok_cb,
false)
  end end local function run(msg, matches)
  if matches[1] == 'rm' and is_owner(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
        return "Could Be More Than 1 !"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid =
msg.to.peer_id, con = matches[2]})
    else
      return "Only in SuperGroups !"
    end
  else
    return "You do not Have Access !"
  end end return {
    patterns = {
        '^[!/#](rm) (%d*)$'
    },
    run = run
}
