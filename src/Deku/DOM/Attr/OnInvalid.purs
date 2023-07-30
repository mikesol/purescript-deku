module Deku.DOM.Attr.OnInvalid where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnInvalid = OnInvalid

instance Attr anything OnInvalid Cb where
  attr OnInvalid bothValues  = unsafeAttribute $ Both { key: "invalid", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "invalid", value:  cb' value  })
  pureAttr OnInvalid value  = unsafeAttribute $ This { key: "invalid", value:  cb' value  }
  unpureAttr OnInvalid eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "invalid", value:  cb' value  }

instance Attr anything OnInvalid (Effect Unit) where
  attr OnInvalid bothValues  = unsafeAttribute $ Both { key: "invalid", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "invalid", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnInvalid value  = unsafeAttribute $ This { key: "invalid", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnInvalid eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "invalid", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnInvalid (Effect Boolean) where
  attr OnInvalid bothValues  = unsafeAttribute $ Both { key: "invalid", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "invalid", value:  cb' (Cb (const value))  })
  pureAttr OnInvalid value  = unsafeAttribute $ This { key: "invalid", value:  cb' (Cb (const value))  }
  unpureAttr OnInvalid eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "invalid", value:  cb' (Cb (const value))  }

type OnInvalidEffect =
  forall element
   . Attr element OnInvalid (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnInvalid Unit where
  attr OnInvalid bothValues  = unsafeAttribute $ Both { key: "invalid", value:  unset'  } (snd bothValues <#> \_ -> { key: "invalid", value:  unset'  })
  pureAttr OnInvalid _  = unsafeAttribute $ This { key: "invalid", value:  unset'  }
  unpureAttr OnInvalid eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "invalid", value:  unset'  }
