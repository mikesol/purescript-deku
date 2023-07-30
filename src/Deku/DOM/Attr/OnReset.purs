module Deku.DOM.Attr.OnReset where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnReset = OnReset

instance Attr anything OnReset Cb where
  attr OnReset bothValues  = unsafeAttribute $ Both { key: "reset", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "reset", value:  cb' value  })
  pureAttr OnReset value  = unsafeAttribute $ This { key: "reset", value:  cb' value  }
  unpureAttr OnReset eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "reset", value:  cb' value  }

instance Attr anything OnReset (Effect Unit) where
  attr OnReset bothValues  = unsafeAttribute $ Both { key: "reset", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "reset", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnReset value  = unsafeAttribute $ This { key: "reset", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnReset eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "reset", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnReset (Effect Boolean) where
  attr OnReset bothValues  = unsafeAttribute $ Both { key: "reset", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "reset", value:  cb' (Cb (const value))  })
  pureAttr OnReset value  = unsafeAttribute $ This { key: "reset", value:  cb' (Cb (const value))  }
  unpureAttr OnReset eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "reset", value:  cb' (Cb (const value))  }

type OnResetEffect =
  forall element
   . Attr element OnReset (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnReset Unit where
  attr OnReset bothValues  = unsafeAttribute $ Both { key: "reset", value:  unset'  } (snd bothValues <#> \_ -> { key: "reset", value:  unset'  })
  pureAttr OnReset _  = unsafeAttribute $ This { key: "reset", value:  unset'  }
  unpureAttr OnReset eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "reset", value:  unset'  }
