module Deku.DOM.Attr.OnTouchmove where

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

data OnTouchmove = OnTouchmove

instance Attr anything OnTouchmove (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both (pure 
    { key: "touchmove", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "touchmove", value: cb' value })
instance Attr anything OnTouchmove (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTouchmove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "touchmove", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "touchmove", value: cb' value })
instance Attr anything OnTouchmove  Cb  where
  attr OnTouchmove value = unsafeAttribute $ This $ pure $
    { key: "touchmove", value: cb' value }
instance Attr anything OnTouchmove (Event.Event  Cb ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' value }

instance Attr anything OnTouchmove (ST.ST Global.Global  Cb ) where
  attr OnTouchmove iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "touchmove", value: cb' value }

instance Attr anything OnTouchmove (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both (pure 
    { key: "touchmove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchmove (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTouchmove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "touchmove", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchmove  (Effect Unit)  where
  attr OnTouchmove value = unsafeAttribute $ This $ pure $
    { key: "touchmove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchmove (Event.Event  (Effect Unit) ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchmove (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTouchmove iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "touchmove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchmove (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both (pure 
    { key: "touchmove", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchmove (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTouchmove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "touchmove", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchmove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchmove  (Effect Boolean)  where
  attr OnTouchmove value = unsafeAttribute $ This $ pure $
    { key: "touchmove", value: cb' (Cb (const value)) }
instance Attr anything OnTouchmove (Event.Event  (Effect Boolean) ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchmove", value: cb' (Cb (const value)) }

instance Attr anything OnTouchmove (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTouchmove iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "touchmove", value: cb' (Cb (const value)) }

instance Attr everything OnTouchmove (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchmove bothValues = unsafeAttribute $ Both (pure 
    { key: "touchmove", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchmove", value: unset' })
instance Attr everything OnTouchmove (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTouchmove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "touchmove", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "touchmove", value: unset' })
instance Attr everything OnTouchmove  Unit  where
  attr OnTouchmove _ = unsafeAttribute $ This $ pure $
    { key: "touchmove", value: unset' }
instance Attr everything OnTouchmove (Event.Event  Unit ) where
  attr OnTouchmove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchmove", value: unset' }

instance Attr everything OnTouchmove (ST.ST Global.Global  Unit ) where
  attr OnTouchmove iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "touchmove", value: unset' }
