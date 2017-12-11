import React from 'react';

const QuestionIndexCard = (props) => {
  let answerDiv
  if (props.answers.length === 1) {
    answerDiv = <div>answer</div>
  } else {
    answerDiv = <div>answers</div>
  }
  return(
    <div className="question-content-box">
      <div className="stats-container">
        <div className="question-stats-box">
          <div id="answer-count">{props.answers.length}</div>
          {answerDiv}
        </div>
        <div className="question-stats-box">
          <div className="vote-score">score</div>
          <div>votes</div>
        </div>
      </div>
      <div id="question-title">
        <a href={`questions/${props.question.id}`}>{props.question.title}</a>
      </div>
    </div>
  )
}

export default QuestionIndexCard;
