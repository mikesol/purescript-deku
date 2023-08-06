module Deku.DOM.Attr.OnInvalid where

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

data OnInvalid = OnInvalid

instance Attr anything OnInvalid (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "invalid", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "invalid", value: cb' value })
instance Attr anything OnInvalid (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "invalid", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "invalid", value: cb' value })
instance Attr anything OnInvalid  Cb  where
  attr OnInvalid value = unsafeAttribute $ This $ pure $
    { key: "invalid", value: cb' value }
instance Attr anything OnInvalid (Event.Event  Cb ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "invalid", value: cb' value }

instance Attr anything OnInvalid (ST.ST Global.Global  Cb ) where
  attr OnInvalid iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "invalid", value: cb' value }

instance Attr anything OnInvalid (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "invalid", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "invalid", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnInvalid (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "invalid", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "invalid", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnInvalid  (Effect Unit)  where
  attr OnInvalid value = unsafeAttribute $ This $ pure $
    { key: "invalid", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInvalid (Event.Event  (Effect Unit) ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInvalid (ST.ST Global.Global  (Effect Unit) ) where
  attr OnInvalid iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "invalid", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInvalid (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "invalid", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "invalid", value: cb' (Cb (const value)) }
    )
instance Attr anything OnInvalid (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "invalid", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "invalid", value: cb' (Cb (const value)) }
    )
instance Attr anything OnInvalid  (Effect Boolean)  where
  attr OnInvalid value = unsafeAttribute $ This $ pure $
    { key: "invalid", value: cb' (Cb (const value)) }
instance Attr anything OnInvalid (Event.Event  (Effect Boolean) ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const value)) }

instance Attr anything OnInvalid (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnInvalid iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "invalid", value: cb' (Cb (const value)) }

instance Attr everything OnInvalid (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both (pure 
    { key: "invalid", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "invalid", value: unset' })
instance Attr everything OnInvalid (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnInvalid (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "invalid", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "invalid", value: unset' })
instance Attr everything OnInvalid  Unit  where
  attr OnInvalid _ = unsafeAttribute $ This $ pure $
    { key: "invalid", value: unset' }
instance Attr everything OnInvalid (Event.Event  Unit ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "invalid", value: unset' }

instance Attr everything OnInvalid (ST.ST Global.Global  Unit ) where
  attr OnInvalid iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "invalid", value: unset' }
