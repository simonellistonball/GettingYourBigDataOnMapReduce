using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.Hadoop.MapReduce;
using MapReduceExampleLib;
using System.Linq;

namespace Tests
{
    [TestClass]
    public class MapperTests
    {
        private const string line1 = "The quick fox jumped over the lazy dog";
        private const string line2 = "The whiley dog tripped up the cunning fox";

        private StreamingUnitOutput run(string[] data)
        {
            return StreamingUnit.Execute<WordCountMapper, WordCountReducer>(data);
        }

        [TestMethod]
        public void TestMapperSplitsWords()
        {
            var result = run(new[] { line1 });
            Assert.AreEqual(result.MapperResult.Count, 8);
            Assert.AreEqual(result.ReducerResult.Count, 8);

            Assert.AreEqual("1", result.ReducerResult[0].Split('\t')[1]);
        }

        [TestMethod]
        public void TestReducerSums()
        {
            var result = run(new[] { line1, line1 });
            Assert.AreEqual("2",result.ReducerResult[0].Split('\t')[1]);
        }

        [TestMethod]
        public void TestWordCount()
        {
            var result = run(new[] { line1, line2 });
            var foxes = from n in result.ReducerResult
                        where n.StartsWith("fox")
                        select n;

            Assert.AreEqual(1, foxes.Count());
            Assert.AreEqual("2", foxes.First().Split('\t')[1]); 
        }
    }
}
