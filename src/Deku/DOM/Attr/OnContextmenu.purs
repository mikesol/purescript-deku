module Deku.DOM.Attr.OnContextmenu where

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

data OnContextmenu = OnContextmenu

instance Attr anything OnContextmenu (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnContextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: cb' value })
instance Attr anything OnContextmenu (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnContextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "contextmenu", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: cb' value })
instance Attr anything OnContextmenu  Cb  where
  attr OnContextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: cb' value }
instance Attr anything OnContextmenu (Event.Event  Cb ) where
  attr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' value }

instance Attr anything OnContextmenu (ST.ST Global.Global  Cb ) where
  attr OnContextmenu iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "contextmenu", value: cb' value }

instance Attr anything OnContextmenu (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnContextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contextmenu", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnContextmenu (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnContextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "contextmenu", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contextmenu", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnContextmenu  (Effect Unit)  where
  attr OnContextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnContextmenu (Event.Event  (Effect Unit) ) where
  attr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnContextmenu (ST.ST Global.Global  (Effect Unit) ) where
  attr OnContextmenu iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "contextmenu", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnContextmenu (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnContextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contextmenu", value: cb' (Cb (const value)) }
    )
instance Attr anything OnContextmenu (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnContextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "contextmenu", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "contextmenu", value: cb' (Cb (const value)) }
    )
instance Attr anything OnContextmenu  (Effect Boolean)  where
  attr OnContextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: cb' (Cb (const value)) }
instance Attr anything OnContextmenu (Event.Event  (Effect Boolean) ) where
  attr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: cb' (Cb (const value)) }

instance Attr anything OnContextmenu (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnContextmenu iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "contextmenu", value: cb' (Cb (const value)) }

instance Attr everything OnContextmenu (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnContextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "contextmenu", value: unset' })
instance Attr everything OnContextmenu (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnContextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "contextmenu", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "contextmenu", value: unset' })
instance Attr everything OnContextmenu  Unit  where
  attr OnContextmenu _ = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: unset' }
instance Attr everything OnContextmenu (Event.Event  Unit ) where
  attr OnContextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "contextmenu", value: unset' }

instance Attr everything OnContextmenu (ST.ST Global.Global  Unit ) where
  attr OnContextmenu iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "contextmenu", value: unset' }
