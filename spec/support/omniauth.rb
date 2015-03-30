OmniAuth.config.test_mode = true


OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
                                                                 provider: 'twitter',
                                                                 uid: '123545',
                                                                 info: {
                                                                      name: 'MyName',
                                                                      nickname: 'MyNickName'
                                                                 }
                                                             })

OmniAuth.config.mock_auth[:gplus] = OmniAuth::AuthHash.new({
                                                                 provider: 'gplus',
                                                                 uid: '123545',
                                                                 info: {
                                                                     name: 'MyName',
                                                                     nickname: 'MyNickName',
                                                                     email: 'myemail@mail.com'
                                                                 }
                                                             })

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
                                                               provider: 'facebook',
                                                               uid: '123545',
                                                               info: {
                                                                   name: 'MyName',
                                                                   nickname: 'MyNickName',
                                                                   email: 'myemail@mail.com'
                                                               }
                                                           })