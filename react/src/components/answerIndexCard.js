import React from 'react';

const AnswerIndexCard = (props) => {
  return(
    <div className="answer">
      <div className="answer-votes">votes will go here</div>
      <div className="answer-details">
        <div className="answer-description">{props.answer.answer}</div>
        <div className="answer-stats">
          <div className="answerer">
            <a href={`/users/${props.user.id}`}>{props.user.username}</a>
          </div>
          <div className="answer-timing">answered {props.answer.created_at}</div>
        </div>
      </div>
    </div>
  )
}

export default AnswerIndexCard;
