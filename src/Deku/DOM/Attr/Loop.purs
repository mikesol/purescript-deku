module Deku.DOM.Attr.Loop where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Loop = Loop

instance Attr Audio_ Loop String where
  attr Loop bothValues  = unsafeAttribute $ Both { key: "loop", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "loop", value:  prop' value  })
  pureAttr Loop value  = unsafeAttribute $ This { key: "loop", value:  prop' value  }
  unpureAttr Loop eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loop", value:  prop' value  }

instance Attr Video_ Loop String where
  attr Loop bothValues  = unsafeAttribute $ Both { key: "loop", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "loop", value:  prop' value  })
  pureAttr Loop value  = unsafeAttribute $ This { key: "loop", value:  prop' value  }
  unpureAttr Loop eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loop", value:  prop' value  }

instance Attr everything Loop Unit where
  attr Loop bothValues  = unsafeAttribute $ Both { key: "loop", value:  unset'  } (snd bothValues <#> \_ -> { key: "loop", value:  unset'  })
  pureAttr Loop _  = unsafeAttribute $ This { key: "loop", value:  unset'  }
  unpureAttr Loop eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "loop", value:  unset'  }
