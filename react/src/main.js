import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import QuestionIndexList from './containers/questionIndexList'
import QuestionShow from './containers/questionShow'

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('question-list')){
    ReactDOM.render(
      <QuestionIndexList/>,
      document.getElementById('question-list')
    );
  }
  if (document.getElementById('answers-list')) {
    ReactDOM.render(
      <QuestionShow/>,
      document.getElementById('answers-list')
    );
  }
})
