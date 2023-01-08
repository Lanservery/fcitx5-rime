function date_time_translator(input, seg)
    if (input == "rq") then
        --- Candidate(type, start, end, text, comment)
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
        yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), ""))
    end
    if (input == "sj") then
        local cand_m = Candidate("time", seg.start, seg._end, os.date("%H:%M"), " ")
        local cand_s = Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " ")

        cand_m.quality = 1
        cand_s.quality = 2
        
        yield(cand_m)
        yield(cand_s)
        --- Candidate(type, start, end, text, comment)
    end
    if (input == "xq") then
        local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
        local cand_we = Candidate("week", seg.start, seg._end, "星期"..weakTab[tonumber(os.date("%w")+1)], "")
        local cand_wee = Candidate("week", seg.start, seg._end, "周"..weakTab[tonumber(os.date("%w")+1)], "")
        local cand_week = Candidate("week", seg.start, seg._end, "礼拜"..weakTab[tonumber(os.date("%w")+1)], "")

        cand_we.quality = 1
        cand_wee.quality = 2
        cand_week.quality = 3
        
        yield(cand_we)
        yield(cand_wee)
        yield(cand_week)
    end
end
