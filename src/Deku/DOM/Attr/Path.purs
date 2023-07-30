module Deku.DOM.Attr.Path where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Path = Path

instance Attr AnimateMotion_ Path String where
  attr Path bothValues  = unsafeAttribute $ Both { key: "path", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "path", value:  prop' value  })
  pureAttr Path value  = unsafeAttribute $ This { key: "path", value:  prop' value  }
  unpureAttr Path eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "path", value:  prop' value  }

instance Attr TextPath_ Path String where
  attr Path bothValues  = unsafeAttribute $ Both { key: "path", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "path", value:  prop' value  })
  pureAttr Path value  = unsafeAttribute $ This { key: "path", value:  prop' value  }
  unpureAttr Path eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "path", value:  prop' value  }

instance Attr everything Path Unit where
  attr Path bothValues  = unsafeAttribute $ Both { key: "path", value:  unset'  } (snd bothValues <#> \_ -> { key: "path", value:  unset'  })
  pureAttr Path _  = unsafeAttribute $ This { key: "path", value:  unset'  }
  unpureAttr Path eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "path", value:  unset'  }
