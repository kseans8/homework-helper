import React from 'react';

const QuestionShowCard = (props) => {
  let questionDescription = (
    <div class="question-description">
      <p>No description provided</p>
    </div>
  )
  if (props.question.description !== null) {
    questionDescription = (
      <div className="question-description">
        <p>{props.question.description}</p>
      </div>
    )
  }
  return (
    <div>
      <div className="question-title">{props.question.title}</div>
      <div className="question">
        <div className="question-votes">Votes will go here</div>
        <div className="question-details">
          {questionDescription}
          <div className="question-stats">
            <div className="question-asker">
              <a href={`/users/${props.user.id}`}>{props.user.username}</a></div>
            <div className="question-timing">{props.question.created_at}</div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default QuestionShowCard;
