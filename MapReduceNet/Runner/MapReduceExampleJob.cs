using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Hadoop.MapReduce;
using MapReduceExampleLib;

namespace Runner
{
    class MapReduceExampleJob: HadoopJob<WordCountMapper,WordCountReducer>
    {
        public override HadoopJobConfiguration Configure(ExecutorContext context)
        {
            return new HadoopJobConfiguration
            {
                InputPath = "/user/simonellistonball/wordcount/input/",
                OutputFolder = "/user/simonellistonball/wordcount/output/",
                DeleteOutputFolder = true
            };
        }
    }
}
