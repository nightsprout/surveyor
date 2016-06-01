require 'spec_helper'

describe "surveyor/edit.html.haml" do
  let! (:question_group) { FactoryGirl.create(:question_group) }
  let! (:answers) { FactoryGirl.create_list(:answer, 2) }
  let! (:question) { FactoryGirl.create(:question, question_group: question_group, answers: answers) }
  let! (:survey_section) { FactoryGirl.create(:survey_section, questions: [question]) }
  let! (:survey) { FactoryGirl.create(:survey, sections: [survey_section]) }  
  let (:response_set) { FactoryGirl.create(:response_set, survey: survey) }

  before do
    assign(:survey, survey)
    assign(:response_set, response_set)
    assign(:section, survey.sections.first)
    assign(:sections, survey.sections)
  end

  it "renders the view" do
    render
  end

  it "renders the section partial" do
    render

    rendered.should =~ /section_test_class/
  end

  it "renders the section menu partial" do
    render

    rendered.should =~ /current_section/
  end

  it "renders the question group partial" do
    render

    rendered.should =~ /id=\"g_[0-9]/
  end

  it "renders the question partial" do
    render

    rendered.should =~ /id=\"q_[0-9]/
  end

  it "renders the answer partial" do
    render

    rendered.should =~ /clear/
  end
end
