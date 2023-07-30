module Deku.DOM.Attr.OnStalled where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnStalled = OnStalled

instance Attr anything OnStalled Cb where
  attr OnStalled bothValues  = unsafeAttribute $ Both { key: "stalled", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "stalled", value:  cb' value  })
  pureAttr OnStalled value  = unsafeAttribute $ This { key: "stalled", value:  cb' value  }
  unpureAttr OnStalled eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "stalled", value:  cb' value  }

instance Attr anything OnStalled (Effect Unit) where
  attr OnStalled bothValues  = unsafeAttribute $ Both { key: "stalled", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "stalled", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnStalled value  = unsafeAttribute $ This { key: "stalled", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnStalled eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "stalled", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnStalled (Effect Boolean) where
  attr OnStalled bothValues  = unsafeAttribute $ Both { key: "stalled", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "stalled", value:  cb' (Cb (const value))  })
  pureAttr OnStalled value  = unsafeAttribute $ This { key: "stalled", value:  cb' (Cb (const value))  }
  unpureAttr OnStalled eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "stalled", value:  cb' (Cb (const value))  }

type OnStalledEffect =
  forall element
   . Attr element OnStalled (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnStalled Unit where
  attr OnStalled bothValues  = unsafeAttribute $ Both { key: "stalled", value:  unset'  } (snd bothValues <#> \_ -> { key: "stalled", value:  unset'  })
  pureAttr OnStalled _  = unsafeAttribute $ This { key: "stalled", value:  unset'  }
  unpureAttr OnStalled eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "stalled", value:  unset'  }
