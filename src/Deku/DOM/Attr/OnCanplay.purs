module Deku.DOM.Attr.OnCanplay where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnCanplay = OnCanplay

instance Attr anything OnCanplay (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnCanplay bothValues = unsafeAttribute $ Both (pure 
    { key: "canplay", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "canplay", value: cb' value })
instance Attr anything OnCanplay (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnCanplay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "canplay", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "canplay", value: cb' value })
instance Attr anything OnCanplay  Cb  where
  attr OnCanplay value = unsafeAttribute $ This $ pure $
    { key: "canplay", value: cb' value }
instance Attr anything OnCanplay (Event.Event  Cb ) where
  attr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "canplay", value: cb' value }

instance Attr anything OnCanplay (ST.ST Global.Global  Cb ) where
  attr OnCanplay iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "canplay", value: cb' value }

instance Attr anything OnCanplay (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnCanplay bothValues = unsafeAttribute $ Both (pure 
    { key: "canplay", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplay", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCanplay (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnCanplay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "canplay", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "canplay", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCanplay  (Effect Unit)  where
  attr OnCanplay value = unsafeAttribute $ This $ pure $
    { key: "canplay", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCanplay (Event.Event  (Effect Unit) ) where
  attr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplay (ST.ST Global.Global  (Effect Unit) ) where
  attr OnCanplay iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "canplay", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplay (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnCanplay bothValues = unsafeAttribute $ Both (pure 
    { key: "canplay", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplay", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCanplay (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnCanplay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "canplay", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "canplay", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCanplay  (Effect Boolean)  where
  attr OnCanplay value = unsafeAttribute $ This $ pure $
    { key: "canplay", value: cb' (Cb (const value)) }
instance Attr anything OnCanplay (Event.Event  (Effect Boolean) ) where
  attr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "canplay", value: cb' (Cb (const value)) }

instance Attr anything OnCanplay (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnCanplay iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "canplay", value: cb' (Cb (const value)) }

instance Attr everything OnCanplay (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnCanplay bothValues = unsafeAttribute $ Both (pure 
    { key: "canplay", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "canplay", value: unset' })
instance Attr everything OnCanplay (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnCanplay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "canplay", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "canplay", value: unset' })
instance Attr everything OnCanplay  Unit  where
  attr OnCanplay _ = unsafeAttribute $ This $ pure $
    { key: "canplay", value: unset' }
instance Attr everything OnCanplay (Event.Event  Unit ) where
  attr OnCanplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "canplay", value: unset' }

instance Attr everything OnCanplay (ST.ST Global.Global  Unit ) where
  attr OnCanplay iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "canplay", value: unset' }
