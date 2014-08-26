using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Hadoop.MapReduce;

namespace MapReduceExampleLib
{
    public class WordCountMapper: MapperBase
    {
        public override void Map(string inputLine, MapperContext context)
        {
            var input = inputLine.Split(' ');
            foreach (var word in input) {
                context.EmitKeyValue(word, "1");
            }
        }
    }
}
