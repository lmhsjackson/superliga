module MatchesHelper
  def kifu_linker(kifu)
    capture do
      if kifu
        link_to kifu, kifu
      else
        '-'
      end
    end
  end
end
