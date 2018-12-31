export {
    type Idx; record {
        ip: addr;
    };

    type Val: record {
        timestamp: time;
        reason: string;
    };
}

global blaklist: table[addr] of Val = table();

event bro_init() {
    Input::add_table([$source="blacklist.file", $name="blacklist",
                      $idx=Idx, $val=Val, $destination=blacklist]);
    Input::remove("blacklist");
}

# Filtering
event bro_init() {
Input::add_table([$source="blacklist.file", $name="blacklist",
                  $idx=Idx, $val=Val, $destination=blacklist,
                  $mode=Input::REREAD,
                  $pred(typ: Input::Event, left: Idx, right: Val) = {
                    if (typ != Input::EVENT_NEW ) {
                        return T;
                    }

                    return (current_time() - right$timestamp) < 30day;
                   }]);
}
