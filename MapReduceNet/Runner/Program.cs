using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Hadoop.MapReduce;
using System.Configuration;
using Runner.Properties;

namespace Runner
{
    class Program
    {
        static void Main(string[] args)
        {
            Environment.SetEnvironmentVariable("HADOOP_HOME", @"c:\hadoop");
            Environment.SetEnvironmentVariable("Java_HOME", @"c:\hadoop\jvm");

            // Access an HDInsight Cluster
            var hadoop = Hadoop.Connect(new Uri(Settings.Default.clusterAddress), 
                Settings.Default.clusterUsername, Settings.Default.clusterUsername, 
                Settings.Default.clusterPassword, 
                Settings.Default.storageAccountName,Settings.Default.storageAccountKey, 
                Settings.Default.storageContainer, 
                false);
            // Execute a job based on the definition, which controls input and output destinations
            var result = hadoop.MapReduceJob.ExecuteJob<MapReduceExampleJob>();
        }
    }
}
