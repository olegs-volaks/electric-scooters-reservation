module ApplicationHelper

  def nav_item(name, link, controller: nil)
    current = controller ? controller_name == controller : current_page?(link)
    tag.li do
      link_to name, link, class: "nav-link #{current ? 'active' : ''}"
    end
  end

  def fas_icon(icon, text: nil)
    html = tag.span do
      tag.i '', class: "fa-solid fa-#{icon}"
    end
    html << tag.span(" #{text}") if text.present?

    html
  end

  def page_header(title, link: '#', button_title: nil)
    html = tag.span title

    if button_title.present?
      html << tag.div('', class: 'float-end d-inline-block') do
        link_to button_title, link, class: 'btn btn-outline-dark btn-lg'
      end
    end

    tag.h1 class: 'display-4 border-bottom mb-4 pb-2' do
      html
    end
  end

end
