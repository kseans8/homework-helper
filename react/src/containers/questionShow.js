import React from 'react';
import AnswerIndexCard from '../components/answerIndexCard'
import QuestionShowCard from '../components/questionShowCard'

class QuestionShow extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      question: null,
      answers: [],
      users:[]
    }
  }

  componentDidMount() {
    let thisQuestionId = parseInt($('.page').first().attr("id"))
    fetch(`/api/v1/questions/${thisQuestionId}`)
    .then(response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`;
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        question: body.question,
        answers: body.answers,
        users: body.users
      })
    })
  }

  render() {
    let answerComponents = this.state.answers.map(answer => {
      let user = this.state.users.find(user => {
        return (user.id === answer.user_id)
      })
      return(
        <AnswerIndexCard
          key={answer.id}
          answer={answer}
          user={user}
        />
      )
    })
    let questionCard = <div></div>
    if (this.state.question !== null) {
      let questionAsker = this.state.users.find(user => {
        return (user.id === this.state.question.user_id)
      })
      questionCard = (
        <QuestionShowCard
          key={1}
          question={this.state.question}
          user={questionAsker}
          />
      )
    }

    let answersHeader = (<div/>)

    if (this.state.answers.length === 0) {
      answersHeader = (
        <div className="no-answers">
          <p>No answers for this question yet. Think you can answer it?</p>
        </div>
      )
    } else if (this.state.answers.length ===1) {
      answersHeader = (
          <div className="answer-count">1 Answer</div>
      )
    } else {
      answersHeader = (
          <div className="answer-count">{this.state.answers.length} Answers</div>
      )
    }

    return(
      <div>
        {questionCard}
        {answersHeader}
        {answerComponents}
      </div>
    )
  }
}

export default QuestionShow;
