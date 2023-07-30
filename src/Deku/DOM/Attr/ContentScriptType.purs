module Deku.DOM.Attr.ContentScriptType where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentScriptType = ContentScriptType

instance Attr Svg_ ContentScriptType String where
  attr ContentScriptType bothValues  = unsafeAttribute $ Both { key: "contentScriptType", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "contentScriptType", value:  prop' value  })
  pureAttr ContentScriptType value  = unsafeAttribute $ This { key: "contentScriptType", value:  prop' value  }
  unpureAttr ContentScriptType eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "contentScriptType", value:  prop' value  }

instance Attr everything ContentScriptType Unit where
  attr ContentScriptType bothValues  = unsafeAttribute $ Both { key: "contentScriptType", value:  unset'  } (snd bothValues <#> \_ -> { key: "contentScriptType", value:  unset'  })
  pureAttr ContentScriptType _  = unsafeAttribute $ This { key: "contentScriptType", value:  unset'  }
  unpureAttr ContentScriptType eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "contentScriptType", value:  unset'  }
