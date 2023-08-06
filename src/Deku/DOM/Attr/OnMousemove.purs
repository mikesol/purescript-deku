module Deku.DOM.Attr.OnMousemove where

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

data OnMousemove = OnMousemove

instance Attr anything OnMousemove (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mousemove", value: cb' value })
instance Attr anything OnMousemove (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMousemove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousemove", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mousemove", value: cb' value })
instance Attr anything OnMousemove  Cb  where
  attr OnMousemove value = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: cb' value }
instance Attr anything OnMousemove (Event.Event  Cb ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousemove", value: cb' value }

instance Attr anything OnMousemove (ST.ST Global.Global  Cb ) where
  attr OnMousemove iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousemove", value: cb' value }

instance Attr anything OnMousemove (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousemove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousemove (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMousemove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousemove", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mousemove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousemove  (Effect Unit)  where
  attr OnMousemove value = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousemove (Event.Event  (Effect Unit) ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousemove (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMousemove iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousemove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousemove (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousemove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousemove (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMousemove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousemove", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mousemove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousemove  (Effect Boolean)  where
  attr OnMousemove value = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: cb' (Cb (const value)) }
instance Attr anything OnMousemove (Event.Event  (Effect Boolean) ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousemove", value: cb' (Cb (const value)) }

instance Attr anything OnMousemove (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMousemove iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousemove", value: cb' (Cb (const value)) }

instance Attr everything OnMousemove (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMousemove bothValues = unsafeAttribute $ Both (pure 
    { key: "mousemove", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mousemove", value: unset' })
instance Attr everything OnMousemove (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMousemove (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "mousemove", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mousemove", value: unset' })
instance Attr everything OnMousemove  Unit  where
  attr OnMousemove _ = unsafeAttribute $ This $ pure $
    { key: "mousemove", value: unset' }
instance Attr everything OnMousemove (Event.Event  Unit ) where
  attr OnMousemove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mousemove", value: unset' }

instance Attr everything OnMousemove (ST.ST Global.Global  Unit ) where
  attr OnMousemove iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "mousemove", value: unset' }
