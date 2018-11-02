module ApplicationHelper
  def application_name
    'Lista Telefônica'
  end

  def formata_telefone(telefone)
    return "#{telefone[0..3]}-#{telefone[4..7]}" if telefone.length == 8

    return "(#{telefone[0..1]}) #{telefone[2..5]}-#{telefone[6..9]}" if telefone.length == 10

    '!!!'
  end

  def formata_celular(celular)
    return "#{celular[0..3]}-#{celular[4..7]}" if celular.length == 8

    return "#{celular[0..4]}-#{celular[5..8]}" if celular.length == 9

    return "(#{celular[0..1]}) #{celular[2..6]}-#{celular[7..10]}" if celular.length == 11

    '!!!'
  end

  def tipo_notificacao
    {
      notice: 'info',
      success: 'success',
      alert: 'warn',
      error: 'danger'
    }
  end
end
