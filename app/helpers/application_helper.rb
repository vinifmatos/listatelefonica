module ApplicationHelper
  def application_name
    'Lista Telefônica'
  end

  def formata_telefone(telefone)
    return nil if telefone.nil?

    return "#{telefone[0..3]}-#{telefone[4..7]}" if telefone.length == 8

    return "(#{telefone[0..1]}) #{telefone[2..5]}-#{telefone[6..9]}" if telefone.length == 10

    nil
  end

  def formata_celular(celular)
    return nil if celular.nil?

    return "#{celular[0..3]}-#{celular[4..7]}" if celular.length == 8

    return "#{celular[0..4]}-#{celular[5..8]}" if celular.length == 9

    return "(#{celular[0..1]}) #{celular[2..6]}-#{celular[7..10]}" if celular.length == 11

    nil
  end

  def tipo_notificacao
    {
      notice: 'info',
      success: 'success',
      alert: 'warn',
      error: 'danger'
    }
  end

  def model_erros_to_js_array(model)
    e = model.errors.messages.map { |k, v| { campo: k, msg: v[0] } }.to_json.html_safe
    javascript_tag "
    var erros = #{e};
      $(document).on('turbolinks:load', function() {
        $(document).ready(function() {
          if (erros.length > 0) {
            for (var e of erros) {
              $('##{model.model_name.singular}_' + e.campo).notify(e.msg, 'error');
            }
          }
        });
      });
  "
  end
end
