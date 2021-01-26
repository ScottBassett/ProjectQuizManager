using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.EntityFrameworkCore;
using QuizManager.DataAccess;
using Moq;
using QuizManager.DataAccess.Models;
using QuizManager.Web.Controllers;
using QuizManager.Web.ViewModels;
using Xunit;

namespace QuizManager.Tests
{
    public class AnswersControllerTests
    {
        [Fact]
        public async void CreateAnswerTest()
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
                Id = 3,
                QuizName = testQuizName
            };

            var mockTempData = new Mock<ITempDataDictionary>();
            quizzesController.TempData = mockTempData.Object;

            await quizzesController.Create(testQuiz);

            var questionsController = new QuestionsController(context);

            var testQuestionName = "Test Question";

            var testQuestion = new Question
            {
                Id = 2,
                QuizId = testQuiz.Id,
                QuestionName = testQuestionName
            };

            var mockTempDataForQuestion = new Mock<ITempDataDictionary>();
            questionsController.TempData = mockTempDataForQuestion.Object;

            await questionsController.Create(testQuestion);

            var answersController = new AnswersController(context);

            var testAnswerName1 = "Test Answer 1";
            var testAnswerName2 = "Test Answer 2";
            var testAnswerName3 = "Test Answer 3";
            var testAnswerName4 = "Test Answer 4";

            var testCreateAnswersViewModel = new CreateAnswersViewModel
            {
                
                QuestionId = testQuestion.Id,
                Answers = new List<Answer>()
            };

            var testAnswer1 = new Answer
            {
                Id = 1,
                AnswerName = testAnswerName1,
                IsCorrect = true,
                QuestionId = testQuestion.Id
            };

            var testAnswer2 = new Answer
            {
                Id = 2,
                AnswerName = testAnswerName2,
                IsCorrect = false,
                QuestionId = testQuestion.Id
            };

            var testAnswer3 = new Answer
            {
                Id = 3,
                AnswerName = testAnswerName3,
                IsCorrect = false,
                QuestionId = testQuestion.Id
            };

            var testAnswer4 = new Answer
            {
                Id = 4,
                AnswerName = testAnswerName4,
                IsCorrect = false,
                QuestionId = testQuestion.Id
            };

            testCreateAnswersViewModel.Answers.Add(testAnswer1);
            testCreateAnswersViewModel.Answers.Add(testAnswer2);
            testCreateAnswersViewModel.Answers.Add(testAnswer3);
            testCreateAnswersViewModel.Answers.Add(testAnswer4);

            var mockTempForAnswer = new Mock<ITempDataDictionary>();
            answersController.TempData = mockTempForAnswer.Object;

            // Act
            await answersController.Create(testCreateAnswersViewModel);

            // Assert
            var question = await context.Questions
                .Where(q => q.QuestionName == testQuestion.QuestionName)
                .FirstOrDefaultAsync();


            Assert.Equal(testAnswer1.QuestionId, question.AllAnswers.FirstOrDefault()?.QuestionId);
            Assert.NotNull(question.AllAnswers);
        }
    }
}