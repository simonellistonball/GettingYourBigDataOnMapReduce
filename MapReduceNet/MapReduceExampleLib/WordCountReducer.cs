using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Hadoop.MapReduce;

namespace MapReduceExampleLib
{
    public class WordCountReducer: ReducerCombinerBase
    {
        public override void Reduce(string key, IEnumerable<string> values, ReducerCombinerContext context)
        {
            var count = values.Select(n => Convert.ToInt32(n)).Sum();
            context.EmitKeyValue(key, count.ToString());
        }
    }
}
