# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end


  def name
    if @middle
      @first+ @middle+ @last
    else
      @first + @last
    end
  end

   def createinitials
    @first=@first_name.to_s[0,1]
    @middle= @middle_name.to_s[0,1]
    @last=@last_name.to_s[0,1]
  end


  def fullname
    @first=@first_name+" "
    @middle= @middle_name
    if @middle
      @middle+=" "
    end
    @last=@last_name
    self.name
  end


  def name_with_initial
    @middle=@middle_name
    if @middle
      self.createinitials
      @middle+=". "
    end
    @first=@first_name+" "
    @last=@last_name
    self.name
  end

  def initials
    self.createinitials
    if @middle_name = nil
      @middle = nil
    end
    self.name
  end

end

describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name:"Sarah",last_name:"Lane")

      expect(person.fullname).to eq("Sarah Lane")
    end

    it "does not add extra spaces if middle name is missing" do
      person2 = Person.new(first_name:"Sarah",middle_name:"Jane",last_name:"Lane")

      expect(person2.fullname).to eq("Sarah Jane Lane")
    end

  end

  describe "#full_name_with_middle_initial" do 
    it "returns fullname with middle initial" do 
      person = Person.new(first_name:"Sarah",middle_name: "Jane",last_name:"Lane")

      expect(person.name_with_initial).to eq("Sarah J. Lane")
    end

    it "doesn't add extra space if middle name is missing" do
      person = Person.new(first_name:"Sarah",last_name:"Lane")

      expect(person.name_with_initial).to eq("Sarah Lane")
    end
  end

  describe "#initials" do 
    it "returns initials of name" do
      person = Person.new(first_name:"Sarah",middle_name: "Jane",last_name:"Lane")

      expect(person.initials).to eq ("SJL")
    end
    it "return only two letters if the is no middle name" do 
      person = Person.new(first_name:"Sarah",last_name:"Lane")

      expect(person.initials).to eq("SL")

    end
  end

end