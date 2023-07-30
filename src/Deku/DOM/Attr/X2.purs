module Deku.DOM.Attr.X2 where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X2 = X2

instance Attr Line_ X2 String where
  attr X2 bothValues  = unsafeAttribute $ Both { key: "x2", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "x2", value:  prop' value  })
  pureAttr X2 value  = unsafeAttribute $ This { key: "x2", value:  prop' value  }
  unpureAttr X2 eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "x2", value:  prop' value  }

instance Attr LinearGradient_ X2 String where
  attr X2 bothValues  = unsafeAttribute $ Both { key: "x2", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "x2", value:  prop' value  })
  pureAttr X2 value  = unsafeAttribute $ This { key: "x2", value:  prop' value  }
  unpureAttr X2 eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "x2", value:  prop' value  }

instance Attr everything X2 Unit where
  attr X2 bothValues  = unsafeAttribute $ Both { key: "x2", value:  unset'  } (snd bothValues <#> \_ -> { key: "x2", value:  unset'  })
  pureAttr X2 _  = unsafeAttribute $ This { key: "x2", value:  unset'  }
  unpureAttr X2 eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "x2", value:  unset'  }
