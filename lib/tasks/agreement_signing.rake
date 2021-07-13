# module AgreementSigning
namespace :agreement_signing do
  desc "Get test example Dock"

  # todo need read https://github.com/senny/sablon/blob/master/misc/TEMPLATE.md#how-to-add-a-mail-merge-field
  # MERGEFIELD =person.first_name
  # org.name  = Наименование
  # должны подтягиваться из соответствующего пункта анкеты в блоке “Информация об
  # организации”
  #
  #
  # user.position Должность
  # должна
  # “Единоличный исполнительный орган (ЕИО): Должность” блока “Информация об
  # организации”
  #
  # user.full_name
  # ФИО
  task :agreement_signing_system => :environment do
    # @base_path = Pathname.new(File.expand_path("../", __FILE__))
    file_name_in = 'agreement_signing_system.docx'
    file_name_out = SecureRandom.urlsafe_base64
    @base_path = "~/Work/chronicles-gql-martian-library"
    file_in = @base_path + "/public/#{file_name_in}"
    file_out = @base_path + "/public/accel_sprint/users/#{file_name_out}.doc"

    # file_in = "~/Work/chronicles-gql-martian-library/public/#{file_name_in}"
    # file_out = "~/Work/chronicles-gql-martian-library/public/#{file_name_out}.doc"
    # file_out = @base_path.to_s + "/public/accel_sprint/users/#{file_name_out}.doc"

    # template = Sablon.template file_in
    template = Sablon.template File.expand_path(file_in)

    # TODO fix update data
    name = 'Имя организации которая самая хорошая'
    position = 'Директор Директоровского отдела из деректоров, где все директора'
    user_ful_name = 'Иванов Иван Васгенович'
    # name = @course_user.company_name #'Имя организации которая самая хорошая'
    # position = @course_user.anketa_by_type(:base).replies.by_question_skeys(:executive_agency_role).last.try(:body_or_nil) #'Директор Директоровского отдела из деректоров, где все директора'
    # user_ful_name = @course_user.user.fullname #'Иванов Иван Васгенович'
    context = {
      org: {
        name: name
      },
      user: {
        position: position,
        full_name: user_ful_name
      },
      year: Time.new.year,
    }
    template.render_to_file File.expand_path(file_out), context

    p '!!!!!'
    p file_name_out
    p file_out
    p 'file_out'

  end
end
# end
