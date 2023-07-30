module Deku.DOM.Attr.PatternTransform where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform String where
  attr PatternTransform bothValues  = unsafeAttribute $ Both { key: "patternTransform", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "patternTransform", value:  prop' value  })
  pureAttr PatternTransform value  = unsafeAttribute $ This { key: "patternTransform", value:  prop' value  }
  unpureAttr PatternTransform eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "patternTransform", value:  prop' value  }

instance Attr everything PatternTransform Unit where
  attr PatternTransform bothValues  = unsafeAttribute $ Both { key: "patternTransform", value:  unset'  } (snd bothValues <#> \_ -> { key: "patternTransform", value:  unset'  })
  pureAttr PatternTransform _  = unsafeAttribute $ This { key: "patternTransform", value:  unset'  }
  unpureAttr PatternTransform eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "patternTransform", value:  unset'  }
