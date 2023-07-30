module Deku.DOM.Attr.Autoplay where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autoplay = Autoplay

instance Attr Audio_ Autoplay String where
  attr Autoplay bothValues  = unsafeAttribute $ Both { key: "autoplay", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "autoplay", value:  prop' value  })
  pureAttr Autoplay value  = unsafeAttribute $ This { key: "autoplay", value:  prop' value  }
  unpureAttr Autoplay eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "autoplay", value:  prop' value  }

instance Attr Video_ Autoplay String where
  attr Autoplay bothValues  = unsafeAttribute $ Both { key: "autoplay", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "autoplay", value:  prop' value  })
  pureAttr Autoplay value  = unsafeAttribute $ This { key: "autoplay", value:  prop' value  }
  unpureAttr Autoplay eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "autoplay", value:  prop' value  }

instance Attr everything Autoplay Unit where
  attr Autoplay bothValues  = unsafeAttribute $ Both { key: "autoplay", value:  unset'  } (snd bothValues <#> \_ -> { key: "autoplay", value:  unset'  })
  pureAttr Autoplay _  = unsafeAttribute $ This { key: "autoplay", value:  unset'  }
  unpureAttr Autoplay eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "autoplay", value:  unset'  }
