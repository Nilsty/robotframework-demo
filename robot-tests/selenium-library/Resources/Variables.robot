*** Variables ***
# Variables for UI TEST
${LOGIN URL}                    https://www.ultimateqa.com/filling-out-forms/
${BROWSER}                      Chrome
@{chrome_arguments}             --disable-infobars    --headless    --disable-gpu   --no-sandbox   --window-size=1920,1080
${HEADLESS_BROWSER_ENABLED}     False

# SELECTORS
${NAME_FIELD}       css=[name='et_pb_contact_name_0']
${TEXT_FIELD}       css=[data-form_unique_num='0'] [data-id='message'] [data-required_mark]
${SUBMIT_BUTTON}    css=#et_pb_contact_form_0 .et_pb_contact_submit.et_pb_button
${NAME_FIELD2}      css=.et_pb_contact_field_2 #et_pb_contact_name_1
${TEXT_FIELD2}      css=.et_pb_contact_field_3 .et_pb_contact_message.input
${SUBMIT_BUTTON2}   css=#et_pb_contact_form_1 .et_pb_contact_submit.et_pb_button
${CAPTCHA}          css=.et_pb_contact_captcha_question
${CAPTCHA_FIELD}    css=.input.et_pb_contact_captcha
