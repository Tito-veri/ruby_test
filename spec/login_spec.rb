# frozen_string_literal: true

feature 'ログイン' do
  given(:app) { App.new }

  scenario '定義済みユーザ（山田一郎）でログインができること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'ichiro@example.com'
    app.login.password.set 'password'
    app.login.submit.click

    expect(app.my_page.header).to have_text('マイページ')
    expect(app.my_page.username).to have_text('山田一郎')

    take_save_screenshot 'yamada'
  end

  scenario '定義済みユーザ（松本さくら）でログインができること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'sakura@example.com'
    app.login.password.set 'pass1234'
    app.login.submit.click

    expect(app.my_page.header).to have_text('マイページ')
    expect(app.my_page.username).to have_text('松本さくら')

    take_save_screenshot 'matsumoto'
  end

end
