module Deku.DOM.Attr.OnAbort where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAbort = OnAbort

instance Attr anything OnAbort Cb where
  attr OnAbort bothValues  = unsafeAttribute $ Both { key: "abort", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "abort", value:  cb' value  })
  pureAttr OnAbort value  = unsafeAttribute $ This { key: "abort", value:  cb' value  }
  unpureAttr OnAbort eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "abort", value:  cb' value  }

instance Attr anything OnAbort (Effect Unit) where
  attr OnAbort bothValues  = unsafeAttribute $ Both { key: "abort", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "abort", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnAbort value  = unsafeAttribute $ This { key: "abort", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnAbort eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "abort", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnAbort (Effect Boolean) where
  attr OnAbort bothValues  = unsafeAttribute $ Both { key: "abort", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "abort", value:  cb' (Cb (const value))  })
  pureAttr OnAbort value  = unsafeAttribute $ This { key: "abort", value:  cb' (Cb (const value))  }
  unpureAttr OnAbort eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "abort", value:  cb' (Cb (const value))  }

type OnAbortEffect =
  forall element
   . Attr element OnAbort (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAbort Unit where
  attr OnAbort bothValues  = unsafeAttribute $ Both { key: "abort", value:  unset'  } (snd bothValues <#> \_ -> { key: "abort", value:  unset'  })
  pureAttr OnAbort _  = unsafeAttribute $ This { key: "abort", value:  unset'  }
  unpureAttr OnAbort eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "abort", value:  unset'  }
