#Template

#event file_sniff(f: fa_file, meta: fa_metadata)  
#{      
#    ...      
#    if ( ... ) {          
#        Files::add_analyzer(f, Files::ANALYZER_EXTRACT, ... );      
#    }    
#}

#Exercise

#Write a script using the following criteria:

#    Use the template above as the basis for the file extraction script
#    Define a module and export block
#    Create a &redef’able set to hold the MIME-types of interest for extraction
#    Use the set defined in #3 to down-select and attach the Files::ANALYZER_EXTRACT file analysis module
#    Bonus: Add a customized filename to the Files::ANALYZER_EXTRACT analyzer as an option

module FILE_EXTRACT_DOWN_SELECT;

export {
    global allowable: set[string] = set("application/vnd.ms-cab-compressed", "application/x-dosexec") &redef;
}

event file_sniff(f: fa_file, meta: fa_metadata)  
{      
    if ( ! meta?$mime_type ) {
        return;
    }
    if ( meta$mime_type !in allowable ) {
        return;
    }
          
    Files::add_analyzer(f, Files::ANALYZER_EXTRACT );
}
