global mime_to_ext: table[string] of string = {
        ["application/x-dosexec"] = "exe",
        ["image/jpeg"] = "jpg",
        ["application/pdf"] = "pdf",
        ["application/vnd.ms-excel"] = "xls",
        ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] = "xlsx",
        ["application/zip"] = "zip",
        ["application/x-compressed-zip"] = "xzip",
        ["application/x-rar-compressed"] = "rar",
        ["application/msword"] = "doc",
        ["application/vnd.openxmlformats-officedocument.wordprocessingml.document"] = "docx",
        ["application/rtf"] = "rtf",
};

event file_sniff(f: fa_file, meta: fa_metadata)
        {
        if ( f$source != "SMTP" )
                return;

        if ( ! meta?$mime_type )
                return;

        if ( meta$mime_type !in mime_to_ext )
                return;

        local fname = fmt("%s-%s.%s", f$source, f$id, mime_to_ext[meta$mime_type]);
        Files::add_analyzer(f, Files::ANALYZER_EXTRACT, [$extract_filename=fname]);
        }
