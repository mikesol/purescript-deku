module Deku.DOM.Attr.Method where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Method = Method

instance Attr Form_ Method String where
  attr Method bothValues  = unsafeAttribute $ Both { key: "method", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "method", value:  prop' value  })
  pureAttr Method value  = unsafeAttribute $ This { key: "method", value:  prop' value  }
  unpureAttr Method eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "method", value:  prop' value  }

instance Attr TextPath_ Method String where
  attr Method bothValues  = unsafeAttribute $ Both { key: "method", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "method", value:  prop' value  })
  pureAttr Method value  = unsafeAttribute $ This { key: "method", value:  prop' value  }
  unpureAttr Method eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "method", value:  prop' value  }

instance Attr everything Method Unit where
  attr Method bothValues  = unsafeAttribute $ Both { key: "method", value:  unset'  } (snd bothValues <#> \_ -> { key: "method", value:  unset'  })
  pureAttr Method _  = unsafeAttribute $ This { key: "method", value:  unset'  }
  unpureAttr Method eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "method", value:  unset'  }
