module Deku.DOM.Attr.Src where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Src = Src

instance Attr Audio_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Embed_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Iframe_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Img_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Input_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Script_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Source_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Track_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr Video_ Src String where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "src", value:  prop' value  })
  pureAttr Src value  = unsafeAttribute $ This { key: "src", value:  prop' value  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "src", value:  prop' value  }

instance Attr everything Src Unit where
  attr Src bothValues  = unsafeAttribute $ Both { key: "src", value:  unset'  } (snd bothValues <#> \_ -> { key: "src", value:  unset'  })
  pureAttr Src _  = unsafeAttribute $ This { key: "src", value:  unset'  }
  unpureAttr Src eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "src", value:  unset'  }
