
seconds = (x) -> x
minutes = (x) -> x * 60
hours   = (x) -> x * minutes(60)
days    = (x) -> x * hours(24)
months  = (x) -> x * days(30)
years   = (x) -> x * months(12)

secondsToUnits = (s) ->
    tyears = s // years(1)
    s -= years(tyears)
    tmonths = s // months(1)
    s -= months(tmonths)
    tdays = s // days(1)
    s -= days(tdays)
    thours = s // hours(1)
    s -= hours(thours)
    tminutes = s // minutes(1)
    s -= minutes(tminutes)
    tseconds = s
    t =
        years: tyears,
        months: tmonths,
        days: tdays,
        hours: thours,
        minutes: tminutes,
        seconds: tseconds

formatUnits = (u) ->
    a = [ u.years, u.months, u.days, u.hours, u.minutes, u.seconds ]
    for v,index in a
        if v == 0
            delete a[index]
        else
            break
    a = a.filter (x) -> x?
    a = a.map (x) -> pad x, 2
    a.join ':'

pad = (x, n) ->
    x = x + ''
    while x.length < n
        x = '0' + x
    x

$ ->
    countdown = (node) ->
        node = $(node)
        now  = new Date()
        t    = new Date node.attr 'countdown'
        diff = Math.abs(t - now) // 1000
        diff = secondsToUnits diff
        diff = formatUnits diff
        node.html diff
        setTimeout countdown, 500, node
    
    countdown(counter) for counter in $('[countdown]')
