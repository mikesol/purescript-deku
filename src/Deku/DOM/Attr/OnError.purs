module Deku.DOM.Attr.OnError where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnError = OnError

instance Attr anything OnError Cb where
  attr OnError bothValues  = unsafeAttribute $ Both { key: "error", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "error", value:  cb' value  })
  pureAttr OnError value  = unsafeAttribute $ This { key: "error", value:  cb' value  }
  unpureAttr OnError eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "error", value:  cb' value  }

instance Attr anything OnError (Effect Unit) where
  attr OnError bothValues  = unsafeAttribute $ Both { key: "error", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "error", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnError value  = unsafeAttribute $ This { key: "error", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnError eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "error", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnError (Effect Boolean) where
  attr OnError bothValues  = unsafeAttribute $ Both { key: "error", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "error", value:  cb' (Cb (const value))  })
  pureAttr OnError value  = unsafeAttribute $ This { key: "error", value:  cb' (Cb (const value))  }
  unpureAttr OnError eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "error", value:  cb' (Cb (const value))  }

type OnErrorEffect =
  forall element
   . Attr element OnError (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnError Unit where
  attr OnError bothValues  = unsafeAttribute $ Both { key: "error", value:  unset'  } (snd bothValues <#> \_ -> { key: "error", value:  unset'  })
  pureAttr OnError _  = unsafeAttribute $ This { key: "error", value:  unset'  }
  unpureAttr OnError eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "error", value:  unset'  }
