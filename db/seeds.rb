# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([ { name: :Admin},
                       { name: :User }
                     ])

categories = Category.create!([ { title: :Front },
                                { title: :Back },
                                { title: :Mobile }
                              ])

tests = Test.create!([ { title: :React, level: 2, category_id: categories[0].id },
                       { title: :JS,    level: 1, category_id: categories[0].id },
                       { title: :Ruby,  level: 2, category_id: categories[1].id },
                       { title: :RoR,   level: 1, category_id: categories[1].id },
                       { title: :IOS,   level: 2, category_id: categories[2].id }
                     ])

questions = Question.create!([ { body: "Jolly, yo-ho-ho.", test_id: tests[0].id },
                               { body: "Be fraternal for whoever dies, because each has been emerged with result.",
                                 test_id: tests[0].id },
                               { body: "The moon is quickly collective.",
                                 test_id: tests[0].id },
                               { body: "Ecce.",
                                 test_id: tests[1].id },
                               { body: "To some, a body is a density for fearing.",
                                 test_id: tests[1].id },
                               { body: "The lubber blows with desolation, break the freighter until it waves.",
                                 test_id: tests[1].id },
                               { body: "The processor flies mineral like a united teleporter.",
                                 test_id: tests[2].id },
                               { body: "Yes, there is zion, it lures with suffering.",
                                 test_id: tests[2].id },
                               { body: "Urbs messiss, tanquam velox resistentia.",
                                 test_id: tests[2].id },
                               { body: "How clear. You love like a skiff.",
                                 test_id: tests[3].id },
                               { body: "This love has only been transfered by a final space suit.",
                                 test_id: tests[3].id },
                               { body: "Mix the nachos with packaged radish sprouts, chipotle chile powder, curry, and green curry making sure to cover all of it.",
                                 test_id: tests[3].id },
                               { body: "The doubloons fears with passion, view the freighter until it sings.",
                                 test_id: tests[4].id },
                               { body: "Arg, yer not blowing me without a pestilence!",
                                 test_id: tests[4].id },
                               { body: "Tofu can be seasoned with tasty melon, also try whisking the punch with emeril's essence.",
                                 test_id: tests[4].id }
                             ])

answer = Answer.create!([ { body: "Cum impositio studere, omnes nutrixes talem bassus, salvus guttuses.",
                            correct: :true,  question_id: questions[1].id,  user_id: users[1].id },
                          { body: "Belay! Pieces o' halitosis are forever rainy.",
                            correct: :false, question_id: questions[2].id,  user_id: users[0].id },
                          { body: "Aliens resist with procedure at the modern colony!",
                            correct: :true,  question_id: questions[3].id,  user_id: users[1].id },
                          { body: "Try garnishing the celery juice sausagess with crushed fish sauce and soy sauce, warmed.",
                            correct: :false, question_id: questions[4].id,  user_id: users[0].id },
                          { body: "Season the truffels with crushed za'atar, butterscotch, chipotle chile powder, and cumin making sure to cover all of it.",
                            correct: :true,  question_id: questions[5].id,  user_id: users[1].id },
                          { body: "Squid combines greatly with fresh apple.",
                            correct: :false, question_id: questions[6].id,  user_id: users[0].id },
                          { body: "Faith, stigma and a boundless pyramid.",
                            correct: :true,  question_id: questions[7].id,  user_id: users[1].id },
                          { body: "When one meets uniqueness and acceptance, one is able to view control.",
                            correct: :false, question_id: questions[8].id,  user_id: users[0].id },
                          { body: "Golly gosh, well.",
                            correct: :true,  question_id: questions[9].id,  user_id: users[1].id },
                          { body: "Hippotoxotas volare in quadrata!",
                            correct: :false, question_id: questions[10].id, user_id: users[0].id },
                          { body: "Engage.",
                            correct: :true,  question_id: questions[11].id, user_id: users[1].id },
                          { body: "Tremble without tragedy, and we won’t avoid a ship.",
                            correct: :false, question_id: questions[12].id, user_id: users[0].id },
                          { body: "",
                            correct: :true,  question_id: questions[13].id, user_id: users[1].id },
                          { body: "Nunquam imperium brabeuta.",
                            correct: :false, question_id: questions[14].id, user_id: users[0].id },
                          { body: "Per guest prepare seven teaspoons of joghurt with roasted marshmellow for dessert.",
                            correct: :true,  question_id: questions[0].id, user_id: users[1].id }
                        ])

user_test = UserTest.create!([ { user_id: users[1].id, test_id: tests[1].id },
                               { user_id: users[0].id, test_id: tests[2].id },
                               { user_id: users[1].id, test_id: tests[3].id },
                               { user_id: users[0].id, test_id: tests[4].id },
                               { user_id: users[1].id, test_id: tests[0].id }
                             ])