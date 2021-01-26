using System.Linq;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.EntityFrameworkCore;
using QuizManager.DataAccess;
using Moq;
using QuizManager.DataAccess.Models;
using QuizManager.Web.Controllers;
using Xunit;

namespace QuizManager.Tests
{
    public class QuestionsControllerTests
    {
        
        [Fact]
        public async void CreateQuestionTest()
        {
            // Arrange
            DbContextOptions<QuizManagerDbContext> options = new DbContextOptionsBuilder<QuizManagerDbContext>()
                .UseInMemoryDatabase(databaseName: "testDb")
                .Options;

            var context = new QuizManagerDbContext(options);

            var quizzesController = new QuizzesController(context);

            var testQuizName = "Test Quiz";

            var testQuiz = new Quiz
            {
                Id = 2,
                QuizName = testQuizName
            };

            var mockTempData = new Mock<ITempDataDictionary>();
            quizzesController.TempData = mockTempData.Object;

            await quizzesController.Create(testQuiz);

            var questionsController = new QuestionsController(context);

            var testQuestionName = "Test Question";

            var testQuestion = new Question
            {
                Id = 1,
                QuizId = testQuiz.Id,
                QuestionName = testQuestionName
            };

            var mockTempDataForQuestion = new Mock<ITempDataDictionary>();
            questionsController.TempData = mockTempDataForQuestion.Object;

            // Act
            await questionsController.Create(testQuestion);

            // Assert
            var question = await context.Questions.Where(q => q.QuestionName == testQuestion.QuestionName)
                .FirstOrDefaultAsync();

            Assert.NotNull(question);
            Assert.Equal(testQuestion.Id, question.Id);
        }
    }
}