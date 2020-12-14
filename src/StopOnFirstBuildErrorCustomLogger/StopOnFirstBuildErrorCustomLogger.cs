using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Build.Utilities;
using Microsoft.Build.Framework;

public class StopOnFirstBuildErrorCustomLogger : Logger
{
    public override void Initialize(IEventSource eventSource)
    {
        eventSource.ErrorRaised += (sender, e) =>
        {
            var name = nameof(StopOnFirstBuildErrorCustomLogger);
            new List<string>()
            {
                "",
                $"ERROR: intercepted by {name}",
                "ERROR DATA BEGIN:==================",
                Print(e),
                "ERROR DATA END:====================",
                $"{name} aborted the build"
            }.ForEach(Console.WriteLine);
            Environment.Exit(-1);
        };
    }

    static string Print(BuildErrorEventArgs e)
    {
        var props = e.GetType().GetProperties();
        var data = props.Select(p => $"{p.Name}: {p.GetValue(e)}");
        return string.Join(Environment.NewLine, data);
    }
}
