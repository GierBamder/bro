export {
    type Idx: record {
        ip: addr;
    };

    type Val: record {
        timestamp: time;
        reason: string;
    };
}

global blacklist: table[addr] of Val = table();

event bro_init()
{
    Input::add_table([$source="blacklist.file", $name="blacklist",
                      $idx=Idx, $val=Val, $destination=blacklist]);
    Input::remove("blacklist");
}

event http_reply(c: connection, version: string, code: count, reason: string)
{
    if ( c$id$resp_h in blacklist ) {
        print fmt("%s found in blacklist - Reason: %s", c$id$resp_h, blacklist[c$id$resp_h]$reason );
    }
}

